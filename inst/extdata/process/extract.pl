use strict;

## https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.dat.gz

open FILE, "gunzip -c uniprot_sprot.dat.gz |";

my $id;
my $taxon_id;
my $organism;
my $gene_id;
my $keyword;

open OUT, ">uniprot_keywords.txt";
print OUT "Uniprot_ID\tTaxon_ID\tEntrez_Gene_ID\tKeywords\n";

while(my $line = <FILE>) {
	if($line =~/^ID\s/) {

		if($line =~/^ID\s+(\w+)\s/) {
			$id = $1;
		}

		$taxon_id = "";
		$organism = "";
		$gene_id = "";
		$keyword = "";
			
		while($line = <FILE>) {

			chomp $line;

			if($line =~/^\/\//) {
				if($keyword ne "" and $gene_id ne "" and $taxon_id ne "") {
					print OUT "$id\t$taxon_id\t$gene_id\t$keyword\n";
				}
				last;
			}

			if($line =~/^OX\s+NCBI_TaxID=(\d+);$/) {
				$taxon_id = $1;
			}

			if($line =~/^OS\s+(\S.*)$/) {
				$organism = $1;
				while(<FILE> =~/^OS\s+(\S.*)$/) {
					$organism .= " ".$1;
				}
			}

			if($line =~/^DR\s+GeneID; (\d+);/) {
				$gene_id = $1;
			}

			if($line =~/^KW\s+(\w.*)$/) {
				$keyword = $1;
				while(<FILE> =~/^KW\s+(\w.*)$/) {
					$keyword .= " ".$1;
				}
			}
		}

	}
}
