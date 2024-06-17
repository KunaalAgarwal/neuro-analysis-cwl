cwlVersion: v1.0
class: CommandLineTool
baseCommand: flirt
hints:
  DockerRequirement:
    dockerPull: brainlife/fsl
inputs:
  in_file:
    type: File
    inputBinding:
      position: 1
  reference:
    type: File
    inputBinding:
      position: 2
  out_file:
    type: string
    inputBinding:
      prefix: "-out"
      position: 3
outputs:
  out_file:
    type: File
    outputBinding:
      glob: $(inputs.out_file)
