<?php

$rules = [
    '@PSR12' => true,
    'braces_position' => [
        'anonymous_classes_opening_brace' => 'same_line',
        'anonymous_functions_opening_brace' => 'same_line',
        'classes_opening_brace' => 'same_line',
        'control_structures_opening_brace' => 'same_line',
        'functions_opening_brace' => 'same_line',
    ],
    'no_leading_import_slash' => false,
    'not_operator_with_space' => false,
    'not_operator_with_successor_space' => false,
    'constant_case' => [
        'case' => 'upper'
    ],
];

$finder = (new PhpCsFixer\Finder())
    ->in(__DIR__);

return (new PhpCsFixer\Config())
    ->setRules($rules)
    ->setFinder($finder)
    ->setIndent('  ')
    ->setLineEnding("\n")
    ->setRiskyAllowed(true);
