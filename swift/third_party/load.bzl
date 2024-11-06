load("@bazel_skylib//rules:write_file.bzl", "write_file")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//misc/bazel:lfs.bzl", "lfs_archive", "lfs_files")

_override = {
    # these are used to test new artifacts. Must be empty before merging to main
    "swift-prebuilt-macOS-swift-6.0.2-RELEASE-25.tar.zst": "4c81917da67ff2bb642ef2e34e005466b06f756c958702ec070bcacdb83c2f76",
    "swift-prebuilt-Linux-swift-6.0.2-RELEASE-25.tar.zst": "af1e3355fb476538449424a74f15ce21a0f877c7f85a568e736f0bd6c0239a8f",
    "resource-dir-macOS-swift-6.0.2-RELEASE-33.zip": "38f48790fea144b7cf5918b885f32a0f68e21aa5f3c2f0a5722573cc9e950639",
    "resource-dir-Linux-swift-6.0.2-RELEASE-33.zip": "403374c72e20299951c2c37185404500d15340baaa52bb2d06f8815b03f8071e",
}

_staging_url = "https://github.com/dsp-testing/codeql-swift-artifacts/releases/download/staging-{}/{}"

def _get_override(file):
    prefix, _, _ = file.partition(".")
    for key, value in _override.items():
        if key.startswith(prefix):
            return {"url": _staging_url.format(prefix, key), "sha256": value}
    return None

def _load_resource_dir(plat):
    name = "swift-resource-dir-%s" % plat.lower()
    file = "resource-dir-%s.zip" % plat
    override = _get_override(file)
    if override:
        http_file(
            name = name,
            downloaded_file_path = file,
            **override
        )
    else:
        lfs_files(
            name = name,
            srcs = ["//swift/third_party/resources:%s" % file],
        )

def _load_prebuilt(plat):
    name = "swift-prebuilt-%s" % plat.lower()
    file = "swift-prebuilt-%s.tar.zst" % plat
    override = _get_override(file)
    build = _build % "swift-llvm-support"
    if override:
        http_archive(
            name = name,
            build_file = build,
            **override
        )
    else:
        lfs_archive(
            name = name,
            src = "//swift/third_party/resources:%s" % file,
            build_file = build,
        )

def _github_archive(*, name, repository, commit, build_file = None, sha256 = None):
    github_name = repository[repository.index("/") + 1:]
    maybe(
        repo_rule = http_archive,
        name = name,
        url = "https://github.com/%s/archive/%s.zip" % (repository, commit),
        strip_prefix = "%s-%s" % (github_name, commit),
        build_file = build_file,
        sha256 = sha256,
    )

_build = "//swift/third_party:BUILD.%s.bazel"

def load_dependencies(module_ctx):
    for plat in ("macOS", "Linux"):
        _load_prebuilt(plat)
        _load_resource_dir(plat)

    _github_archive(
        name = "picosha2",
        build_file = _build % "picosha2",
        repository = "okdshin/PicoSHA2",
        commit = "27fcf6979298949e8a462e16d09a0351c18fcaf2",
        sha256 = "d6647ca45a8b7bdaf027ecb68d041b22a899a0218b7206dee755c558a2725abb",
    )

    _github_archive(
        name = "binlog",
        build_file = _build % "binlog",
        repository = "morganstanley/binlog",
        commit = "3fef8846f5ef98e64211e7982c2ead67e0b185a6",
        sha256 = "f5c61d90a6eff341bf91771f2f465be391fd85397023e1b391c17214f9cbd045",
    )

    return module_ctx.extension_metadata(
        root_module_direct_deps = "all",
        root_module_direct_dev_deps = [],
    )

swift_deps = module_extension(load_dependencies)

def test_no_override():
    test_body = ["#!/bin/bash", ""]
    test_body += [
        'echo \\"%s\\" override in swift/third/party/load.bzl' % key
        for key in _override
    ]
    if _override:
        test_body.append("exit 1")
    write_file(
        name = "test-no-override-gen",
        out = "test-no-override.sh",
        content = test_body,
        is_executable = True,
    )
    native.sh_test(
        name = "test-no-override",
        srcs = [":test-no-override-gen"],
        tags = ["override"],
    )
