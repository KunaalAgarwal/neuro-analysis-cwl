cwlVersion: v1.2
class: CommandLineTool
label: "AFNI 3dTShift"
baseCommand: ["3dTshift"]

hints:
  DockerRequirement:
    dockerPull: "afni/afni:latest"

inputs:
  inputDataset:
    type: File
    inputBinding:
      position: 1
      prefix: "-input"

  tpattern:
    type: string
    inputBinding:
      position: 2
      prefix: "-tpattern"

outputs:
  shiftedOutput:
    type: File
    outputBinding:
      glob: "*.BRIK"
