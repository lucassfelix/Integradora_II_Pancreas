input = "C:/Users/Lucas/Documents/Faculdade/Integradora/Auto/GT_ATLAS/"
outputMax = "C:/Users/Lucas/Documents/Faculdade/Integradora/Auto/MAXS_ATLAS/"
outputSoma = "C:/Users/Lucas/Documents/Faculdade/Integradora/Auto/SOMAS_ATLAS/"

list = getFileList(input);

setBatchMode(true);
for(i = 0; i < list.length; i++)
{
	action(input,outputMax,outputSoma, list[i],i);
}
function action(input, outputMax, outputSoma, filename, iter){
	open(input + filename);
	selectWindow(input + filename);
	run("8-bit");
	run("Scale...", "x=1.0 y=1.0 z=- width=512 height=512 depth=240 interpolation=Bilinear average process create");
	run("Window/Level...");
	setMinAndMax(0, 2);
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