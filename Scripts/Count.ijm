input = "C:/Users/Lucas/Documents/Faculdade/Integradora/Auto/Composites_ATLAS/"
output = "C:/Users/Lucas/Documents/Faculdade/Integradora/Auto/LUT_ATLAS/"

list = getFileList(input);

//setBatchMode(true);
for(i = 0; i <= list.length; i++)
{
	action(input,output, list[i],i);
}

function action(input, output, file, i)
{
	open(input + file);
	var filename = File.nameWithoutExtension;
	run("Histogram");

	saveAs("Results", output+ filename +"_res.csv");
	close();
	selectWindow(file);
	close();
	
	
}



//setBatchMode(false);