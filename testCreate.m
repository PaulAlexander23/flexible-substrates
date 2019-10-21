function tests = testCreate()
    tests = functiontests(localfunctions);
end

function testCreateRuns(testCase)
    create(linspace(0.001,2.8,2),logspace(-1,5,2),cot(pi/45),1000,1e1,0,0,1e7,0,5,70);
end

function testCreateFloryanRuns(testCase)
    createFloryan(linspace(0.001,2.8,2),logspace(-1,5,2),cot(pi/45),1000,1e1,0,0,1e7,0,5,70);
end
