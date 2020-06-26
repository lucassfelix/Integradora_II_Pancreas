input = "C:/Users/Lucas/Documents/Faculdade/Integradora/Auto/MAXS/"
output = "C:/Users/Lucas/Documents/Faculdade/Integradora/Auto/Composites_ATLAS/"

list = getFileList(input);

setBatchMode(true);
for(i = 22; i <= list.length; i++)
{
	action(input,output, list[i],i);
}

function action(input, output, file, i)
{
	open("C:/Users/Lucas/Documents/Faculdade/Integradora/Auto/MAXS_ATLAS/MAX_MAXS_ATLAS.png");
	open("C:/Users/Lucas/Documents/Faculdade/Integradora/Auto/MAXS/" + file);
	run("Merge Channels...", "c1=" + file +" c2=MAX_MAXS_ATLAS.png create keep");
	saveAs("PNG", output + (i+1) + "_COMP.png");
	close();
	close();
	selectWindow("MAX_MAXS_ATLAS.png");
	close();
	
}



setBatchMode(false);