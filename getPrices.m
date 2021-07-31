function [Open, Close,tDay] = getPrices(symbol,startDate,endDate,lag)
% getPrices retrive the price date from yahoo using datafeed toolbox based 
% on one symbol from (startdate - lag) to (enddate)
% Prices included Open and Close.
% Copyright 2016 - 2017 The MathWorks, Inc.

% Set start date
%     startDate = startDate - lag;

% Import Open and Close prices
symbol = char(symbol);
% startYear = num2str(year(startDate ));
% endYear = num2str(year(endDate));
% startDate = [datestr(startDate, 'mmm+dd'), '%2C+', startYear];
% endDate = [datestr(endDate, 'mmm+dd'), '%2C+', endYear ];

% url = ['http://finance.google.com/finance/historical?startdate=' ... 
% startDate '&enddate=' endDate '&num=200&q=' symbol '&output=csv'];
% websave('data.csv',url);

startDate1 = datestr (startDate); 
endDate1 = datestr (endDate) ;
data = getMarketDataViaYahoo(symbol, startDate1, endDate1, '1d');
% writetable (data, 'data.csv');
% data = readtable('data.csv');
% delete 'data.csv';
data = sortrows(data);
data.Properties.VariableNames{1} = 'Date';

Open = data.Open;
Close = data.Close;
tDay = datenum(data.Date) + 730485; 
end