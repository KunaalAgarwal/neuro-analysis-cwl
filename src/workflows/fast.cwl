cwlVersion: v1.0
class: CommandLineTool
baseCommand: fast
hints:
  DockerRequirement:
    dockerPull: fsl/fsl:latest
inputs:
  in_file:
    type: File
    inputBinding:
      position: 1
outputs:
  segmented_files:
    type: Directory
    outputBinding:
      glob: "$(inputs.in_file.nameroot)_seg"