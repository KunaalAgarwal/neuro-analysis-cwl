cwlVersion: v1.2
class: CommandLineTool
label: "AFNI 3dTstat"
baseCommand: ["3dTstat"]

hints:
  DockerRequirement:
    dockerPull: "afni/afni:latest"

inputs:
  inputDataset:
    type: File
    inputBinding:
      position: 1
      prefix: "-prefix"
      valueFrom: $(self.basename)
      
  mask:
    type: string
    inputBinding:
      position: 2
      prefix: "-mask"

  options:
    type: string
    inputBinding:
      position: 3
      prefix: "-options"
    default: "-mean"
    doc: "Statistical operation to perform"

outputs:
  outputStats:
    type: File
    outputBinding:
      glob: "*.BRIK"
  outputHeader:
    type: File
    outputBinding:
      glob: "*.HEAD"
