input = "C:/Users/Lucas/Documents/Faculdade/Integradora/input/"
output = "C:/Users/Lucas/Documents/Faculdade/Integradora/Mascaras/"
list = getFileList(input);

setBatchMode(true);
for(i = 0; i < list.length; i++)
{
	action(input,output, list[i],i + 60);
}
function action(input, output, filename, iter){
	open(input + filename);
	selectWindow(input + filename);
	run("Scale...", "x=1.0 y=1.0 z=- width=512 height=512 depth=100 interpolation=Bilinear average process create");
	run("Window/Level...");
	run("Apply LUT", "stack");
	run("Close");
	
	run("Z Project...", "projection=[Sum Slices]");
	saveAs("png", output + iter+ "_SOMA" );
	close();
	run("Z Project...", "projection=[Max Intensity]");
	saveAs("png", output + iter+ "_MAX" );
	close();
	close();
	selectWindow(input + filename);
	close();
}
setBatchMode(false);