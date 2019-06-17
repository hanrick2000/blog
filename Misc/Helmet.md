<!-- helm template --output-dir ${output_dir} --name ${cluster_name} --values ./clusterconfig/${cluster_name}.yml ${helm_type} -->


#### Syntax
- `---`: indicate the start of a YAML document
-

#### Commands
- --debug --dry-run
```bash
helm create mychart


```

#### Objects
- Release
- Values
  - --set foo=bar
- Files.Get/GetBytes

#### Functions
-

#### Controlling Whitespace

#### Misc
- . is a reference to the current scope.
- $ - this variable will always point to the root context
- |-, a multi-line string

```text
{{- $relname := .Release.Name -}}
```

#### Resources
- https://helm.sh/docs/
-
