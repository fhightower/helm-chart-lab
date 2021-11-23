# Principles

- Piping values into functions is preferable to calling a function with an argument as it is more extensible.

    Prefer:

    ```
    {{ .Values.drink | quote }}
    ```

    To:

    ```
    {{ quote .Values.drink }}
    ```

- Use `default` for computed values. If you find yourself using `default` for static values, these shold probably go in the `values.yaml`.
- Prefix names of templates with the chart name (e.g. `mychart.labels` rather than `labels`)
- Prefer `include` to `template` (and `block`) as `include` is easier to pipeline with output formatting changes and can dynamically reference templates
- Global values can be accessed from the chart in which they are defined and any subcharts (using a name like `{{ .Values.global.___ }}`)
- You can debug a template by commenting something out:

    ```
    # some: problem section
    # {{ .Values.foo | quote }}
    ```
- `helm template {CHART_NAME}` is really helpful
- When defining a template helper, put `-` on both sides of the helper definition and end:

    ```
    {{- define "mychart.labels" -}}
    ...
    {{- end -}}
    ```
- The order in which values are given to the `merge` function may be important; if you are merging some data into a variable which is referenced later, put the variable first:

    ```
    {{ merge $labels (dict "a" "a")}}
    ```

    instead of:

    ```
    {{ merge (dict "a" "a") $labels}}
    ```
- When referencing something more than one level deep (e.g. `$.Values.foo.bar`), you either need to check that `$.Values.foo` exists before referencing `$.Values.foo.bar` or you will get errors
