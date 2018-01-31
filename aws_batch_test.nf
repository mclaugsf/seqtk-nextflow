params.fastq_input = 'C097F_N_111207.2.AGTTGCTT_R2_xxx.fastq.gz'
params.total_reads = 11
params.outdir = 'steve.test'

outdir      = file(params.outdir)
fastq_input = file(params.fastq_input)

total_reads = params.total_reads


process seqtk {
	publishDir params.outdir + '/seqtk/', mode: 'copy', overwrite:true
	echo true

	input:
	file fastq_input
	val total_reads 

	output:
	file 'output.fastq' into fastq_output

	"""
	seqtk sample ${fastq_input} ${total_reads} > output.fastq
	"""
}
