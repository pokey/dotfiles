#!/usr/bin/env python
import json

import yaml


with open('karabiner.yaml') as f:
    complex_modifications_input = yaml.load(f)

with open('karabiner-input.json') as f:
    config = json.load(f)

complex_modifications = [
    {
        'type': 'basic',
        'from': {'key_code': mapping['from']},
        'to': [mapping['to']],
        'conditions': [
            {
                'type': 'variable_if',
                'name': 'launcher_mode',
                'value': 1
            }
        ]
    }
    for mapping in complex_modifications_input['launcher_mode']
]

rule = (
    config['profiles'][0]['complex_modifications']['rules'][0]
)
rule['manipulators'] = complex_modifications + rule['manipulators']

out = json.dumps(
    config,
    sort_keys=True,
    indent=4,
    separators=(',', ': ')
)
print(out)
