cwlVersion: v1.2
class: CommandLineTool
baseCommand: flirt

hints:
  DockerRequirement:
    dockerPull: brainlife/fsl

inputs:
  brainImagingFile:
    type: File
    inputBinding:
      position: 1
      prefix: "-in"

  reference:
    type: File
    inputBinding:
      position: 2
      prefix: "-ref"

  outputFileName:
    type: string
    default: "output.nii.gz"
    inputBinding:
      position: 3
      prefix: "-out"

outputs:
  resultFile:
   type: File
   outputBinding:
      glob: $(inputs.outputFileName) 
