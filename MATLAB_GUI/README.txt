In MATLAB, run:
1. mydata = loadfiles(`folder path (optional)`, `column # of px to extract(optional)`, `# frames to skip between extractions (optional)`)
2. mypics = e_grabframe(mydata, `# frames to roll over at`, `coarse offset adjustment`, `fine offset adjustment`)
3. To extract a specific picture:
	frame = extract_pics(mypics, `the frame # to extract)