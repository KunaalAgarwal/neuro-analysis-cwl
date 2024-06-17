cwlVersion: v1.0
class: CommandLineTool
baseCommand: fnirt
hints:
  DockerRequirement:
    dockerPull: fsl/fsl:latest
inputs:
  config_file:
    type: File
    inputBinding:
      prefix: "--config"
      position: 1
  in_file:
    type: File
    inputBinding:
      prefix: "--in"
      position: 2
  ref_file:
    type: File
    inputBinding:
      prefix: "--ref"
      position: 3
outputs:
  out_file:
    type: File
    outputBinding:
      glob: "$(inputs.in_file.nameroot)_warped"
