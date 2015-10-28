LAVA: Lightweight Assignment of Variant Alleles
===============================================

### Usage

##### Preprocessing

    lava dict <input FASTA> <input SNP list> <output ref dict> <output SNP dict>

The SNP list should be in [UCSC's txt-based format][1].

##### Processing

    lava lava <input ref dict> <input SNP dict> <input FASTQ> <chrlens file> <output file>
    
The "chrlens file" is generated in the preprocessing stage, and should have a name of <code><i>ref_file.fa</i>.chrlens</code> where *`ref_file.fa`* is the reference sequence FASTA file.

### Requirements

- ~60 gigabytes of RAM for typical reference genomes
- GCC 4.8.4 or later (not tested on earlier versions)
- `make`

### TODO

- Make error rate and average coverage parameters user-specified. For now they are constants in [`lava.h`](include/lava.h).
- Multithreading


[1]: http://genome.ucsc.edu/cgi-bin/hgTables?db=hg19&hgta_group=varRep&hgta_track=snp141Common&hgta_table=snp141Common&hgta_doSchema=describe+table+schema