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
- Prefer `include` to `template` as `include` is easier to pipeline with output formatting changes
- 
