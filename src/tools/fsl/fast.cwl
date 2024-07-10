cwlVersion: v1.2
class: CommandLineTool
baseCommand: [fast]

hints:
  DockerRequirement:
    dockerPull: brainlife/fsl

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.brainImagingFile)
      - entryname: "output_directory"
        entry: |
          mkdir -p output_directory
        writable: true

inputs:
  brainImagingFile:
    type: File
    inputBinding:
      position: 1
      valueFrom: $(self.basename)

outputs:
  segmented_files:
    type: File[]
    outputBinding:
      glob: "output_directory/*.nii.gz"

arguments:
  - prefix: "-o"
    valueFrom: "output_directory/$(inputs.brainImagingFile.nameroot)"
