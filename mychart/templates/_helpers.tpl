{{/* Generate basic labels */}}
{{- define "mychart.labels" -}}
generator: helm
date: {{ now | htmlDate }}
{{- end -}}
