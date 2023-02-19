;; extends

((variable_name) @variable.builtin
 (#eq? @variable.builtin "this"))

[
 "$"
] @keyword

(namespace_name_as_prefix) @namespace

[
 (string)
 (encapsed_string)
 (heredoc_body)
 (nowdoc_body)
 (shell_command_expression) ; backtick operator: `ls -la`
 ] @string @nospell


((comment) @_tname (#match? @_tname "TODO"))@string
((comment) @_fname (#match? @_fname "FIXME"))@string
((comment) @_nname (#match? @_nname "NOTE"))@string
((comment) @_nname (#match? @_nname "BUG"))@string
