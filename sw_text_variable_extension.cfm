<cfscript>
	
	//value is return string which include variable such as "Hello. #Name# It is #Degree# Degree. Do you know the #Secret#?"
	string = value;
	
	//Take every variable to the array a
	a = REMatch("##[^##]+##", string);
	
	//The number of variable
	count = ArrayLen(a);
	
	//Only if a variable exists inside of the value it would evaluate variables, before rendering
	if(count>0){
	
	//Take the # sign off
	for(i=1;i<=count;i++){
      a[i] = ReReplaceNoCase(a[i],"(##)","","all");
    }
	
	//Override variable protection by putting caller.
	for(i=1;i<=count;i++){
      a[i] = "##caller."&a[i]&"##";
    }
	
	//*Evaluate* every variable to actual value and store at the array a
	//Same as replacing the variable with the actual value
    for(i=1;i<=count;i++){
      a[i] = ReReplaceNoCase(a[i],"(##[^##]+##)",evaluate(#a[i]#),"all");
    }
    
	//Replace the place holder in the string with the actual value in array a
    for(i=1;i<=count;i++){
      string = ReReplaceNoCase(string, "(##[^##]+##)", "#a[i]#", "one");

      }
	value = string;
	
	}
</cfscript>