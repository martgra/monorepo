# Monorepo structure

Made easy structure for a python monorep with several packages. Most notable changes are:

## Same namespace for libraries. 
Made same namespace for libraries which means that all ```lib1``` ```lib2``` can be imported as such:
```python
# Valid
import same_name.lib1
import same_name.lib2

# Also valid
from same_name import lib1
from same_name import lib2
```

```bash
lib
├── lib1
│   ├── pyproject.toml
│   ├── same_name
│   │   └── lib1
│   │       ├── __init__.py
│   └── tests
└── lib2
    ├── pyproject.toml
    ├── same_name
    │   └── lib2
    │       └── __init__.py
    └── tests
```


Based on the current answers:
* [support namespace packing](https://github.com/python-poetry/poetry/issues/167#issuecomment-664437916)
* [Poetry documentation](https://python-poetry.org/docs/pyproject/#packages)

## Ediable code
Changing code inside a project or library will not need a "fresh" install. This means that changes made in source will apply directly when reimporting package or module. 

This is due to option in root pyproject.toml file as shown here:
```config
project1 = {path = "projects/project1", develop = true}
...
"same-name.lib1" = {path = "lib/lib1", develop = true}
```

Removing the develop = true will result that a ```poetry instal``` will install the dependencies to the current interpeteres *site-packages* i.e ```$WORKSPACE/.venv/lib/python3.8/site_packages/[LIB NAME]```

https://github.com/python-poetry/poetry/discussions/1135#discussioncomment-579065
