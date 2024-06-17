cwlVersion: v1.0
class: CommandLineTool
baseCommand: run_first_all
hints:
  DockerRequirement:
    dockerPull: fsl/fsl:latest
inputs:
  in_file:
    type: File
    inputBinding:
      position: 1
outputs:
  segmented_structures:
    type: Directory
    outputBinding:
      glob: "$(inputs.in_file.nameroot)-first"
