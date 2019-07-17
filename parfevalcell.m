function out = parfevalcell(fcn, args, numout)
    if nargin < 3, numout = nargout(fcn); end
    
    numberOfJobs = length(args);
    out = cell(numberOfJobs, 1);
    parfor j = 1:numberOfJobs
        temp = cell(1,numout);
        [temp{:}] = fcn(args{j}{:});
        out{j} = temp;
    end
end