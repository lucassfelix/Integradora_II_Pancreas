input = "C:/Users/Lucas/Documents/Faculdade/Integradora/Auto/GT_PANCREAS/"
output = "C:/Users/Lucas/Documents/Faculdade/Integradora/Auto/MAXS/"
outputSoma = "C:/Users/Lucas/Documents/Faculdade/Integradora/Auto/SOMAS/"

list = getFileList(input);

setBatchMode(true);
for(i = 0; i < list.length; i++)
{
	action(input,outputMax,outputSoma, list[i],i);
}
function action(input, outputMax, outputSoma, filename, iter){
	open(input + filename);
	selectWindow(input + filename);
	run("Scale...", "x=1.0 y=1.0 z=- width=512 height=512 depth=100 interpolation=Bilinear average process create");
	run("Window/Level...");
	run("Apply LUT", "stack");
	run("Close");
	
	run("Z Project...", "projection=[Sum Slices]");
	saveAs("png", outputSoma + (iter+1) + "_SOMA" );
	close();
	run("Z Project...", "projection=[Max Intensity]");
	saveAs("png", outputMax + (iter+1) + "_MAX" );
	close();
	close();
	selectWindow(input + filename);
	close();
}
setBatchMode(false);