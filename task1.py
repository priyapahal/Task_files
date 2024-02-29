from Bio import Entrez
import pandas as pd

df = pd.read_csv("Homo_sapiens.gene_info",sep='\t',index_col='Symbol')
    
def gene_symbol_to_entrez_id(symbol):
    print(symbol)
    try:
        g_id = df.loc[symbol,'GeneID']
        print(g_id)
        print(f'{symbol} has been converted to {g_id}')
        return g_id
    except Exception as e:
        pass
    
with open('h.all.v2023.1.Hs.symbols.gmt','r') as f, open('output__h.all.v2023.1.Hs.symbols.gmt','w') as of:
    for line in f.readlines():
        output_list = []
        line = line.split('\t')
        output_list.append(line[0])
        output_list.append(line[1])

        for i in line[2:]:
            i = i.strip()
            if ' ' in i:
                i = i.replace(' ','-')
            e_id = gene_symbol_to_entrez_id(i)
            output_list.append(str(e_id))
        of.writelines('\t'.join(output_list)+'\n')