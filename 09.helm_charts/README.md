```
{{.Values.my.custom.data}}
{{.Chart.Name}}
{{.Chart.Version}}
{{.Chart.AppVersion}}
{{.Chart.Annotations}}
{{.Release.Name}}
{{.Release.Namespace}}
{{.Release.IsInstall}}
{{.Release.IsUpgrade}}
{{.Release.Service}}
{{.Template.Name}}
{{.Template.BasePath}}
{{.Values.my.custom.data | default "testdefault" | upper}}
{{ $myFLAG := .Values.my.flag}}
{{- if $myFLAG }}
{{"Output of if" | nindent 2}}
{{- else}}
{{"Output of else" | nindent 2}}
{{- end}}
{{- with .Values.my.values}}
{{- toYaml . | nindent 2}}
{{- end}}
{{- range .Values.my.values}}
- {{. | upper}}
{{- end}}

# {{- range $key, $value := .Values.image }}
# - {{$key}}: {{$value}}
# {{- end}}
```

```
helm template firstchart
helm dependency update firstchart
helm install myfirstapp firstchart
helm uninstall myfirstapp firstchart
helm test myfirstapp
```