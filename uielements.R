#uielements.R

complexInput = function(variable, realID, imagID){
  div(style = "display:block",
      div(style="display:inline-block",variable," = "),
      div(style="display:inline-block",numericInput(inputId = realID,label = NULL,value = 2, width = "100px")),
      div(style="display:inline-block"," + "),
      div(style="display:inline-block",numericInput(inputId = imagID,label = NULL, value = 1, width = "100px")),
      div(style="display:inline-block","i")
      )
}