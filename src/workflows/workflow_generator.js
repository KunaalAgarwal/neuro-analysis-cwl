const fs = require('fs');

function generateCWL(toolConfig) {
    const cwlTemplate = `
cwlVersion: v1.2
class: CommandLineTool
label: "${toolConfig.label}"
baseCommand: [${toolConfig.baseCommand.join(', ')}]
hints:
  DockerRequirement:
    dockerPull: "${toolConfig.dockerImage}"
inputs:
  ${toolConfig.inputs.map(input => `${input.id}:
    type: ${input.type}
    inputBinding:
      position: ${input.position}
      prefix: "${input.prefix}"
      separate: ${input.separate}`).join('\n  ')}

outputs:
  ${toolConfig.outputs.map(output => `${output.id}:
    type: ${output.type}
    outputBinding:
      glob: "${output.glob}"`).join('\n  ')}`;

    // Write the CWL file
    fs.writeFile(`${toolConfig.label.toLowerCase().replace(/ /g, '_')}.cwl`, cwlTemplate, (err) => {
        if (err) throw err;
        console.log('CWL file has been generated!');
    });
}

// Example usage
const toolConfig = {
    label: "Basic FNIRT",
    baseCommand: ["fnirt"],
    dockerImage: "brainlife/fsl",
    inputs: [
        { id: "reference", type: "File", position: 1, prefix: "--ref=", separate: false },
        { id: "brainImagingFile", type: "File", position: 2, prefix: "--in=", separate: false }
    ],
    outputs: [
        { id: "outputCoefficients", type: "File", glob: "*.nii.gz" }
    ]
};

generateCWL(toolConfig);
