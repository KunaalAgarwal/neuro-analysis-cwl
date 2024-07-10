cwlVersion: v1.2
class: CommandLineTool
baseCommand: [bet]
# Usage: bet <input> <output> [options]

hints: 
  DockerRequirement: 
    dockerPull: brainlife/fsl

inputs: 
  brainImagingFile:
    type: File
    inputBinding:
      position: 1
  outputFileName:
    type: string
    default: "output.nii.gz"
    inputBinding:
      position: 2
  frac:
    type: float
    default: 0.5
    inputBinding:
      position: 3
      prefix: "-f"

outputs: 
  resultFile:
    type: File
    outputBinding:
      glob: $(inputs.outputFileName)
