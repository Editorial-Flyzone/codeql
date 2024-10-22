/**
 * @name Jump-to-definition links
 * @description Generates use-definition pairs that provide the data
 *              for jump-to-definition in the code viewer.
 * @kind definitions
 * @id rust/ide-jump-to-definition
 * @tags ide-contextual-queries/local-definitions
 */

import codeql.IDEContextual
import codeql.rust.elements.Variable
import codeql.rust.elements.Locatable
import Definitions

external string selectedSourceFile();

from Locatable e, Variable def, string kind
where
  def = definitionOf(e, kind) and
  e.getLocation().getFile() = getFileBySourceArchiveName(selectedSourceFile())
select e, def, kind
