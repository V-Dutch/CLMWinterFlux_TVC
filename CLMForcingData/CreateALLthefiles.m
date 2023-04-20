% create appropriate matlab files by just changing attribute and renaming.
% attributes are 'days since the start of every month'
% leap years are 2020,2016,2012.....
startyear=1500 % Change this
endyear=2012 % Change this
% V1.3 - Loops 2013-2016
% Bits that need to be changed: Filename itself and 'days since' attribute.

%% Sort Years

yearleap=[];
Fillfrom2013=[1501];
Fillfrom2014=[1502];
Fillfrom2015=[1503];

for y=startyear:endyear
    if mod(y,4) == 0 && (mod(y,100) ~= 0 || mod(y,400) == 0); % we have leap year
    yearleap=vertcat(yearleap,y);
    end
    % Non-leap years
    if any(y-1==yearleap)
           Fillfrom2013 = vertcat(Fillfrom2013,y);
            
    elseif any(y-2==yearleap)
           Fillfrom2014 = vertcat(Fillfrom2014,y);
        
    elseif any(y-3==yearleap)
         Fillfrom2015 = vertcat(Fillfrom2015,y);
    end
end

%% Plot to sanity check
% x = 1:1:125;
% 
% figure()
% hold on
% scatter(yearleap,x)
% scatter(Fillfrom2013,x)
% scatter(Fillfrom2014,x)
% scatter(Fillfrom2015,x)
% hold off

% Plot misses years 1700-1703, 1800-03, 1900-03 ... few enough of these I
% should be able to brute force it? Create files for these years at the end
% after this? Or just add to lists? then do .nc file creation as separate
% loop?

Missing2013 = rot90([1701,1801,1901,1700]);
Missing2014 = rot90([1702,1802,1902,1800]);
Missing2015 = rot90([1703,1803,1903,1900,1500]);

Fillfrom2013 = vertcat(Fillfrom2013,Missing2013);
Fillfrom2014 = vertcat(Fillfrom2014,Missing2014);
Fillfrom2015 = vertcat(Fillfrom2015,Missing2015);

%% Create .nc files
for y = startyear:endyear
% Fill leap years from 2016
    if any(y==yearleap) %fill from 2016
        inputnc1=sprintf('2016-01.nc'); %source file - Jan
        outputnc1=sprintf('%d-01.nc',y); % copyfile (changes on loop)
        copyfile(inputnc1,outputnc1); %copy the file 
        % rewrite attribute of outputfilenc1
        attributestatement=sprintf('days since %d-01-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc1,'time','units',attributestatement); % overwrite the attribute
        inputnc2=sprintf('2016-02.nc'); %source file - Feb
        outputnc2=sprintf('%d-02.nc',y); % copyfile (changes on loop)
        copyfile(inputnc2,outputnc2); %copy the file 
        % rewrite attribute of outputfilenc2
        attributestatement=sprintf('days since %d-02-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc2,'time','units',attributestatement); % overwrite the attribute 
        inputnc3=sprintf('2016-03.nc'); %source file - Mar
        outputnc3=sprintf('%d-03.nc',y); % copyfile (changes on loop)
        copyfile(inputnc3,outputnc3); %copy the file 
        % rewrite attribute of outputfilenc3
        attributestatement=sprintf('days since %d-03-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc3,'time','units',attributestatement); % overwrite the attribute
        inputnc4=sprintf('2016-04.nc'); %source file
        outputnc4=sprintf('%d-04.nc',y); % copyfile (changes on loop)
        copyfile(inputnc4,outputnc4); %copy the file 
        % rewrite attribute of outputfilenc4
        attributestatement=sprintf('days since %d-04-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc4,'time','units',attributestatement); % overwrite the attribute 
        inputnc5=sprintf('2016-05.nc'); %source file - May
        outputnc5=sprintf('%d-05.nc',y); % copyfile (changes on loop)
        copyfile(inputnc5,outputnc5); %copy the file 
        % rewrite attribute of outputfilenc5
        attributestatement=sprintf('days since %d-05-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc5,'time','units',attributestatement); % overwrite the attribute 
        inputnc6=sprintf('2016-06.nc'); %source file - June
        outputnc6=sprintf('%d-06.nc',y); % copyfile (changes on loop)
        copyfile(inputnc6,outputnc6); %copy the file 
        % rewrite attribute of outputfilenc6
        attributestatement=sprintf('days since %d-06-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc6,'time','units',attributestatement); % overwrite the attribute
        inputnc7=sprintf('2016-07.nc'); %source file - July
        outputnc7=sprintf('%d-07.nc',y); % copyfile (changes on loop)
        copyfile(inputnc7,outputnc7); %copy the file 
        % rewrite attribute of outputfilenc7
        attributestatement=sprintf('days since %d-07-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc7,'time','units',attributestatement); % overwrite the attribute  
        inputnc8=sprintf('2016-08.nc'); %source file - Aug
        outputnc8=sprintf('%d-08.nc',y); % copyfile (changes on loop)
        copyfile(inputnc8,outputnc8); %copy the file 
        % rewrite attribute of outputfilenc8
        attributestatement=sprintf('days since %d-08-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc8,'time','units',attributestatement); % overwrite the attribute  
        inputnc9=sprintf('2016-09.nc'); %source file - Sept
        outputnc9=sprintf('%d-09.nc',y); % copyfile (changes on loop)
        copyfile(inputnc9,outputnc9); %copy the file 
        % rewrite attribute of outputfilenc9
        attributestatement=sprintf('days since %d-09-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc9,'time','units',attributestatement); % overwrite the attribute  
        inputnc10=sprintf('2016-10.nc'); %source file - Oct
        outputnc10=sprintf('%d-10.nc',y); % copyfile (changes on loop)
        copyfile(inputnc10,outputnc10); %copy the file 
        % rewrite attribute of outputfilenc10
        attributestatement=sprintf('days since %d-10-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc10,'time','units',attributestatement); % overwrite the attribute  
        inputnc11=sprintf('2016-11.nc'); %source file - Nov
        outputnc11=sprintf('%d-11.nc',y); % copyfile (changes on loop)
        copyfile(inputnc11,outputnc11); %copy the file 
        % rewrite attribute of outputfilenc11
        attributestatement=sprintf('days since %d-11-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc11,'time','units',attributestatement); % overwrite the attribute
        inputnc12=sprintf('2016-12.nc'); %source file - Dec
        outputnc12=sprintf('%d-12.nc',y); % copyfile (changes on loop)
        copyfile(inputnc12,outputnc12); %copy the file 
        % rewrite attribute of outputfilenc12
        attributestatement=sprintf('days since %d-12-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc12,'time','units',attributestatement); % overwrite the attribute
    end
    % Fill from 2013
    if any(y==Fillfrom2013)
       inputnc1=sprintf('2013-01.nc'); %source file - Jan
       outputnc1=sprintf('%d-01.nc',y); % copyfile (changes on loop)
       copyfile(inputnc1,outputnc1); %copy the file 
       % rewrite attribute of outputfilenc1
       attributestatement=sprintf('days since %d-01-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc1,'time','units',attributestatement); % overwrite the attribute
       inputnc2=sprintf('2013-02.nc'); %source file - Feb
       outputnc2=sprintf('%d-02.nc',y); % copyfile (changes on loop)
       copyfile(inputnc2,outputnc2); %copy the file 
       % rewrite attribute of outputfilenc2
       attributestatement=sprintf('days since %d-02-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc2,'time','units',attributestatement); % overwrite the attribute 
       inputnc3=sprintf('2013-03.nc'); %source file - Mar
       outputnc3=sprintf('%d-03.nc',y); % copyfile (changes on loop)
       copyfile(inputnc3,outputnc3); %copy the file 
       % rewrite attribute of outputfilenc3
       attributestatement=sprintf('days since %d-03-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc3,'time','units',attributestatement); % overwrite the attribute
       inputnc4=sprintf('2013-04.nc'); %source file
       outputnc4=sprintf('%d-04.nc',y); % copyfile (changes on loop)
       copyfile(inputnc4,outputnc4); %copy the file 
       % rewrite attribute of outputfilenc4
       attributestatement=sprintf('days since %d-04-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc4,'time','units',attributestatement); % overwrite the attribute 
       inputnc5=sprintf('2013-05.nc'); %source file - May
       outputnc5=sprintf('%d-05.nc',y); % copyfile (changes on loop)
       copyfile(inputnc5,outputnc5); %copy the file 
       % rewrite attribute of outputfilenc5
       attributestatement=sprintf('days since %d-05-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc5,'time','units',attributestatement); % overwrite the attribute 
       inputnc6=sprintf('2013-06.nc'); %source file - June
       outputnc6=sprintf('%d-06.nc',y); % copyfile (changes on loop)
       copyfile(inputnc6,outputnc6); %copy the file 
       % rewrite attribute of outputfilenc6
       attributestatement=sprintf('days since %d-06-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc6,'time','units',attributestatement); % overwrite the attribute
       inputnc7=sprintf('2013-07.nc'); %source file - July
       outputnc7=sprintf('%d-07.nc',y); % copyfile (changes on loop)
       copyfile(inputnc7,outputnc7); %copy the file 
       % rewrite attribute of outputfilenc7
       attributestatement=sprintf('days since %d-07-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc7,'time','units',attributestatement); % overwrite the attribute  
       inputnc8=sprintf('2013-08.nc'); %source file - Aug
       outputnc8=sprintf('%d-08.nc',y); % copyfile (changes on loop)
       copyfile(inputnc8,outputnc8); %copy the file 
       % rewrite attribute of outputfilenc8
       attributestatement=sprintf('days since %d-08-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc8,'time','units',attributestatement); % overwrite the attribute  
       inputnc9=sprintf('2013-09.nc'); %source file - Sept
       outputnc9=sprintf('%d-09.nc',y); % copyfile (changes on loop)
       copyfile(inputnc9,outputnc9); %copy the file 
       % rewrite attribute of outputfilenc9
       attributestatement=sprintf('days since %d-09-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc9,'time','units',attributestatement); % overwrite the attribute  
       inputnc10=sprintf('2013-10.nc'); %source file - Oct
       outputnc10=sprintf('%d-10.nc',y); % copyfile (changes on loop)
       copyfile(inputnc10,outputnc10); %copy the file 
       % rewrite attribute of outputfilenc10
       attributestatement=sprintf('days since %d-10-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc10,'time','units',attributestatement); % overwrite the attribute  
       inputnc11=sprintf('2013-11.nc'); %source file - Nov
       outputnc11=sprintf('%d-11.nc',y); % copyfile (changes on loop)
       copyfile(inputnc11,outputnc11); %copy the file 
       % rewrite attribute of outputfilenc11
       attributestatement=sprintf('days since %d-11-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc11,'time','units',attributestatement); % overwrite the attribute
       inputnc12=sprintf('2013-12.nc'); %source file - Dec
       outputnc12=sprintf('%d-12.nc',y); % copyfile (changes on loop)
       copyfile(inputnc12,outputnc12); %copy the file 
       % rewrite attribute of outputfilenc12
       attributestatement=sprintf('days since %d-12-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc12,'time','units',attributestatement); % overwrite the attribute
    end
    % Fill from 2014
    if any(y==Fillfrom2014)
       inputnc1=sprintf('2014-01.nc'); %source file - Jan
       outputnc1=sprintf('%d-01.nc',y); % copyfile (changes on loop)
       copyfile(inputnc1,outputnc1); %copy the file 
       % rewrite attribute of outputfilenc1
       attributestatement=sprintf('days since %d-01-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc1,'time','units',attributestatement); % overwrite the attribute
       inputnc2=sprintf('2014-02.nc'); %source file - Feb
       outputnc2=sprintf('%d-02.nc',y); % copyfile (changes on loop)
       copyfile(inputnc2,outputnc2); %copy the file 
       % rewrite attribute of outputfilenc2
       attributestatement=sprintf('days since %d-02-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc2,'time','units',attributestatement); % overwrite the attribute 
       inputnc3=sprintf('2014-03.nc'); %source file - Mar
       outputnc3=sprintf('%d-03.nc',y); % copyfile (changes on loop)
       copyfile(inputnc3,outputnc3); %copy the file 
       % rewrite attribute of outputfilenc3
       attributestatement=sprintf('days since %d-03-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc3,'time','units',attributestatement); % overwrite the attribute
       inputnc4=sprintf('2014-04.nc'); %source file
       outputnc4=sprintf('%d-04.nc',y); % copyfile (changes on loop)
       copyfile(inputnc4,outputnc4); %copy the file 
       % rewrite attribute of outputfilenc4
       attributestatement=sprintf('days since %d-04-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc4,'time','units',attributestatement); % overwrite the attribute 
       inputnc5=sprintf('2014-05.nc'); %source file - May
       outputnc5=sprintf('%d-05.nc',y); % copyfile (changes on loop)
       copyfile(inputnc5,outputnc5); %copy the file 
       % rewrite attribute of outputfilenc5
       attributestatement=sprintf('days since %d-05-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc5,'time','units',attributestatement); % overwrite the attribute 
       inputnc6=sprintf('2014-06.nc'); %source file - June
       outputnc6=sprintf('%d-06.nc',y); % copyfile (changes on loop)
       copyfile(inputnc6,outputnc6); %copy the file 
       % rewrite attribute of outputfilenc6
       attributestatement=sprintf('days since %d-06-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc6,'time','units',attributestatement); % overwrite the attribute
       inputnc7=sprintf('2014-07.nc'); %source file - July
       outputnc7=sprintf('%d-07.nc',y); % copyfile (changes on loop)
       copyfile(inputnc7,outputnc7); %copy the file 
       % rewrite attribute of outputfilenc7
       attributestatement=sprintf('days since %d-07-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc7,'time','units',attributestatement); % overwrite the attribute  
       inputnc8=sprintf('2014-08.nc'); %source file - Aug
       outputnc8=sprintf('%d-08.nc',y); % copyfile (changes on loop)
       copyfile(inputnc8,outputnc8); %copy the file 
       % rewrite attribute of outputfilenc8
       attributestatement=sprintf('days since %d-08-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc8,'time','units',attributestatement); % overwrite the attribute  
       inputnc9=sprintf('2014-09.nc'); %source file - Sept
       outputnc9=sprintf('%d-09.nc',y); % copyfile (changes on loop)
       copyfile(inputnc9,outputnc9); %copy the file 
       % rewrite attribute of outputfilenc9
       attributestatement=sprintf('days since %d-09-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc9,'time','units',attributestatement); % overwrite the attribute  
       inputnc10=sprintf('2014-10.nc'); %source file - Oct
       outputnc10=sprintf('%d-10.nc',y); % copyfile (changes on loop)
       copyfile(inputnc10,outputnc10); %copy the file 
       % rewrite attribute of outputfilenc10
       attributestatement=sprintf('days since %d-10-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc10,'time','units',attributestatement); % overwrite the attribute  
       inputnc11=sprintf('2014-11.nc'); %source file - Nov
       outputnc11=sprintf('%d-11.nc',y); % copyfile (changes on loop)
       copyfile(inputnc11,outputnc11); %copy the file 
       % rewrite attribute of outputfilenc11
       attributestatement=sprintf('days since %d-11-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc11,'time','units',attributestatement); % overwrite the attribute
       inputnc12=sprintf('2014-12.nc'); %source file - Dec
       outputnc12=sprintf('%d-12.nc',y); % copyfile (changes on loop)
       copyfile(inputnc12,outputnc12); %copy the file 
       % rewrite attribute of outputfilenc12
       attributestatement=sprintf('days since %d-12-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc12,'time','units',attributestatement); % overwrite the attribute
    end
    % Fill from 2015
    if any (y==Fillfrom2015)
       inputnc1=sprintf('2015-01.nc'); %source file - Jan
       outputnc1=sprintf('%d-01.nc',y); % copyfile (changes on loop)
       copyfile(inputnc1,outputnc1); %copy the file 
       % rewrite attribute of outputfilenc1
       attributestatement=sprintf('days since %d-01-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc1,'time','units',attributestatement); % overwrite the attribute
       inputnc2=sprintf('2015-02.nc'); %source file - Feb
       outputnc2=sprintf('%d-02.nc',y); % copyfile (changes on loop)
       copyfile(inputnc2,outputnc2); %copy the file 
       % rewrite attribute of outputfilenc2
       attributestatement=sprintf('days since %d-02-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc2,'time','units',attributestatement); % overwrite the attribute 
       inputnc3=sprintf('2015-03.nc'); %source file - Mar
       outputnc3=sprintf('%d-03.nc',y); % copyfile (changes on loop)
       copyfile(inputnc3,outputnc3); %copy the file 
       % rewrite attribute of outputfilenc3
       attributestatement=sprintf('days since %d-03-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc3,'time','units',attributestatement); % overwrite the attribute
       inputnc4=sprintf('2015-04.nc'); %source file
       outputnc4=sprintf('%d-04.nc',y); % copyfile (changes on loop)
       copyfile(inputnc4,outputnc4); %copy the file 
       % rewrite attribute of outputfilenc4
       attributestatement=sprintf('days since %d-04-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc4,'time','units',attributestatement); % overwrite the attribute 
       inputnc5=sprintf('2015-05.nc'); %source file - May
       outputnc5=sprintf('%d-05.nc',y); % copyfile (changes on loop)
       copyfile(inputnc5,outputnc5); %copy the file 
       % rewrite attribute of outputfilenc5
       attributestatement=sprintf('days since %d-05-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc5,'time','units',attributestatement); % overwrite the attribute 
       inputnc6=sprintf('2015-06.nc'); %source file - June
       outputnc6=sprintf('%d-06.nc',y); % copyfile (changes on loop)
       copyfile(inputnc6,outputnc6); %copy the file 
       % rewrite attribute of outputfilenc6
       attributestatement=sprintf('days since %d-06-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc6,'time','units',attributestatement); % overwrite the attribute
       inputnc7=sprintf('2015-07.nc'); %source file - July
       outputnc7=sprintf('%d-07.nc',y); % copyfile (changes on loop)
       copyfile(inputnc7,outputnc7); %copy the file 
       % rewrite attribute of outputfilenc7
       attributestatement=sprintf('days since %d-07-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc7,'time','units',attributestatement); % overwrite the attribute  
       inputnc8=sprintf('2015-08.nc'); %source file - Aug
       outputnc8=sprintf('%d-08.nc',y); % copyfile (changes on loop)
       copyfile(inputnc8,outputnc8); %copy the file 
       % rewrite attribute of outputfilenc8
       attributestatement=sprintf('days since %d-08-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc8,'time','units',attributestatement); % overwrite the attribute  
       inputnc9=sprintf('2015-09.nc'); %source file - Sept
       outputnc9=sprintf('%d-09.nc',y); % copyfile (changes on loop)
       copyfile(inputnc9,outputnc9); %copy the file 
       % rewrite attribute of outputfilenc9
       attributestatement=sprintf('days since %d-09-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc9,'time','units',attributestatement); % overwrite the attribute  
       inputnc10=sprintf('2015-10.nc'); %source file - Oct
       outputnc10=sprintf('%d-10.nc',y); % copyfile (changes on loop)
       copyfile(inputnc10,outputnc10); %copy the file 
       % rewrite attribute of outputfilenc10
       attributestatement=sprintf('days since %d-10-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc10,'time','units',attributestatement); % overwrite the attribute  
       inputnc11=sprintf('2015-11.nc'); %source file - Nov
       outputnc11=sprintf('%d-11.nc',y); % copyfile (changes on loop)
       copyfile(inputnc11,outputnc11); %copy the file 
       % rewrite attribute of outputfilenc11
       attributestatement=sprintf('days since %d-11-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc11,'time','units',attributestatement); % overwrite the attribute
       inputnc12=sprintf('2015-12.nc'); %source file - Dec
       outputnc12=sprintf('%d-12.nc',y); % copyfile (changes on loop)
       copyfile(inputnc12,outputnc12); %copy the file 
       % rewrite attribute of outputfilenc12
       attributestatement=sprintf('days since %d-12-01 00:00:00',y); %correct the statement
       ncwriteatt(outputnc12,'time','units',attributestatement); % overwrite the attribute
    end
end

%% Overwrite 1700, 1800, 1900

for y=1700:100:1900;%fill from 2016
        inputnc1=sprintf('2016-01.nc'); %source file - Jan
        outputnc1=sprintf('%d-01.nc',y); % copyfile (changes on loop)
        copyfile(inputnc1,outputnc1); %copy the file 
        % rewrite attribute of outputfilenc1
        attributestatement=sprintf('days since %d-01-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc1,'time','units',attributestatement); % overwrite the attribute
        % LEAVE FEB AS NEED 28 DAYS!
        inputnc3=sprintf('2016-03.nc'); %source file - Mar
        outputnc3=sprintf('%d-03.nc',y); % copyfile (changes on loop)
        copyfile(inputnc3,outputnc3); %copy the file 
        % rewrite attribute of outputfilenc3
        attributestatement=sprintf('days since %d-03-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc3,'time','units',attributestatement); % overwrite the attribute
        inputnc4=sprintf('2016-04.nc'); %source file
        outputnc4=sprintf('%d-04.nc',y); % copyfile (changes on loop)
        copyfile(inputnc4,outputnc4); %copy the file 
        % rewrite attribute of outputfilenc4
        attributestatement=sprintf('days since %d-04-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc4,'time','units',attributestatement); % overwrite the attribute 
        inputnc5=sprintf('2016-05.nc'); %source file - May
        outputnc5=sprintf('%d-05.nc',y); % copyfile (changes on loop)
        copyfile(inputnc5,outputnc5); %copy the file 
        % rewrite attribute of outputfilenc5
        attributestatement=sprintf('days since %d-05-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc5,'time','units',attributestatement); % overwrite the attribute 
        inputnc6=sprintf('2016-06.nc'); %source file - June
        outputnc6=sprintf('%d-06.nc',y); % copyfile (changes on loop)
        copyfile(inputnc6,outputnc6); %copy the file 
        % rewrite attribute of outputfilenc6
        attributestatement=sprintf('days since %d-06-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc6,'time','units',attributestatement); % overwrite the attribute
        inputnc7=sprintf('2016-07.nc'); %source file - July
        outputnc7=sprintf('%d-07.nc',y); % copyfile (changes on loop)
        copyfile(inputnc7,outputnc7); %copy the file 
        % rewrite attribute of outputfilenc7
        attributestatement=sprintf('days since %d-07-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc7,'time','units',attributestatement); % overwrite the attribute  
        inputnc8=sprintf('2016-08.nc'); %source file - Aug
        outputnc8=sprintf('%d-08.nc',y); % copyfile (changes on loop)
        copyfile(inputnc8,outputnc8); %copy the file 
        % rewrite attribute of outputfilenc8
        attributestatement=sprintf('days since %d-08-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc8,'time','units',attributestatement); % overwrite the attribute  
        inputnc9=sprintf('2016-09.nc'); %source file - Sept
        outputnc9=sprintf('%d-09.nc',y); % copyfile (changes on loop)
        copyfile(inputnc9,outputnc9); %copy the file 
        % rewrite attribute of outputfilenc9
        attributestatement=sprintf('days since %d-09-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc9,'time','units',attributestatement); % overwrite the attribute  
        inputnc10=sprintf('2016-10.nc'); %source file - Oct
        outputnc10=sprintf('%d-10.nc',y); % copyfile (changes on loop)
        copyfile(inputnc10,outputnc10); %copy the file 
        % rewrite attribute of outputfilenc10
        attributestatement=sprintf('days since %d-10-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc10,'time','units',attributestatement); % overwrite the attribute  
        inputnc11=sprintf('2016-11.nc'); %source file - Nov
        outputnc11=sprintf('%d-11.nc',y); % copyfile (changes on loop)
        copyfile(inputnc11,outputnc11); %copy the file 
        % rewrite attribute of outputfilenc11
        attributestatement=sprintf('days since %d-11-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc11,'time','units',attributestatement); % overwrite the attribute
        inputnc12=sprintf('2016-12.nc'); %source file - Dec
        outputnc12=sprintf('%d-12.nc',y); % copyfile (changes on loop)
        copyfile(inputnc12,outputnc12); %copy the file 
        % rewrite attribute of outputfilenc12
        attributestatement=sprintf('days since %d-12-01 00:00:00',y); %correct the statement
        ncwriteatt(outputnc12,'time','units',attributestatement); % overwrite the attribute
end
