{{_input_:var}}Decoder : D.Decoder 
{{_input_:var}}Decoder =
    D.map{{_cursor}}
        (D.field "" D.string)
        (D.field "" D.string)
        (D.field "" D.string)
        (D.field "" D.string)
