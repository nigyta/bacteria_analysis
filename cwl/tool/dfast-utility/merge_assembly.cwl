#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
requirements:
    # InlineJavascriptRequirement: {}
    DockerRequirement:
        dockerImageId:  dfast-cwl:1.2.4
        dockerFile:
          $include: ../docker_file/dfast/Dockerfile


baseCommand: [python]
arguments: [$(inputs.script), --base_gbk, $(inputs.base_gbk), --repeat_gbk, $(inputs.repeat_gbk), --output_fasta, $(inputs.output_fasta)]
inputs:
    # outdir: string
    script:
      type: File
      default:
        class: File
        location: ../scripts/merge_rrna_contigs.py
    base_gbk: File
    repeat_gbk: File
    output_fasta:
        type: string
        default: merged.genome.fasta

outputs:
  merged_genome:
    type: File
    outputBinding:
       glob: $(inputs.output_fasta)
