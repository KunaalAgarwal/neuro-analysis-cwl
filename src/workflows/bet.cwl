cwlVersion: v1.0
class: CommandLineTool
baseCommand: bet
hints:
  DockerRequirement:
    dockerPull: fsl/fsl:latest
inputs:
  in_file:
    type: File
    inputBinding:
      position: 1
  out_file:
    type: string
    inputBinding:
      position: 2
  frac:
    type: float
    inputBinding:
      prefix: "-f"
      position: 3
      default: 0.5
outputs:
  out_file:
    type: File
    outputBinding:
      glob: $(inputs.out_file)
