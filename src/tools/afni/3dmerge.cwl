cwlVersion: v1.2
class: CommandLineTool
label: "AFNI 3dmerge"
baseCommand: ["3dmerge"]

hints:
  DockerRequirement:
    dockerPull: "afni/afni:latest"

inputs:
  inputDataset:
    type: File
    inputBinding:
      position: 1
      prefix: "-doall"

  blurFWHM:
    type: float
    inputBinding:
      position: 2
      prefix: "-1blur_fwhm"

outputs:
  mergedOutput:
    type: File
    outputBinding:
      glob: "*.BRIK"
