cwlVersion: v1.2
class: CommandLineTool
label: "Basic FNIRT"
baseCommand: [fnirt]
# Example usage: 
# fnirt --ref=<some template> --in=<some image>
# Outputs log file and .nii.gz file
# fnirt --ref=<some template> --in=<some image> --infwhm=8,4,2 --subsamp=4,2,1 --warpres=8,8,8

hints:
  DockerRequirement:
    dockerPull: "brainlife/fsl"

inputs:
  reference: 
    type: File
    inputBinding:
        position: 1
        prefix: "--ref="
        separate: false

  brainImagingFile:
    type: File
    inputBinding:
      position: 2
      prefix: "--in="
      separate: false

outputs:
  outputCoefficients:
    type: File
    outputBinding:
      glob: "*.nii.gz"

  logFile:
    type: File
    outputBinding:
      glob: "*.log"
