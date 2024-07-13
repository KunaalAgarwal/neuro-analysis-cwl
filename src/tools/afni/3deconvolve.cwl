cwlVersion: v1.2
class: CommandLineTool
label: "AFNI 3dDeconvolve"
baseCommand: ["3dDeconvolve"]

hints:
  DockerRequirement:
    dockerPull: "afni/afni:latest"

inputs:
  inputDataset:
    type: File
    inputBinding:
      position: 1
      prefix: "-input"

  polort:
    type: int
    inputBinding:
      position: 2
      prefix: "-polort"

outputs:
  statsOutput:
    type: File
    outputBinding:
      glob: "*.BRIK"
  headerOutput:
    type: File
    outputBinding:
      glob: "*.HEAD"
