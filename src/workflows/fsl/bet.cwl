cwlVersion: v1.0
class: CommandLineTool
baseCommand: bet
hints:
  DockerRequirement:
    dockerPull: brainlife/fsl
requirements:
  InlineJavascriptRequirement: {}

inputs:
  in_file:
    type: File
    inputBinding:
      position: 1
  out_file:
    type: string
    inputBinding:
      position: 2
  frac:
    type: float
    default: 0.5
    inputBinding:
      prefix: "-f"
      position: 3

# outputs:
#   out_file:
#     type: File
#     outputBinding:
#       glob: $(inputs.out_file)
