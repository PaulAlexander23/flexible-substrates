function tests = testInBoth()
    tests = functiontests(localfunctions);
end

function testAllMatch(testCase)
    a = ones(10,1);
    b = zeros(10,1);
    
    verifyEqual(testCase,inBoth(a,a),a);
    verifyEqual(testCase,inBoth(b,b),b);
end

function testOneMatch(testCase)
    a = ones(10,1);
    b = zeros(10,1);
    b(1) = 1;
    
    verifyEqual(testCase,inBoth(a,b),1);
end

function testNoMatch(testCase)
    a = ones(10,1);
    b = zeros(10,1);
    
    verifySize(testCase,inBoth(a,b),[0,1]);
end

function testCommutative(testCase)
    r = [0.959492426392903, 0.655740699156587, 0.035711678574190, 0.849129305868777, 0.933993247757551, 0.678735154857773, 0.757740130578333, 0.743132468124916, 0.392227019534168, 0.655477890177557]';
    r2 = r;
    r2(2:2:5) = 0;
    verifyEqual(testCase, inBoth(r,r2), inBoth(r2,r));
end

function testRelTolMatch(testCase)
    a = [0.959492426392903, 0.655740699156587, 0.035711678574190, 0.849129305868777, 0.933993247757551, 0.678735154857773, 0.757740130578333, 0.743132468124916, 0.392227019534168, 0.655477890177557]';
    b = a + 1e-7;
    
    verifyEqual(testCase,inBoth(a,b,'RelTol',1e-4),a);
end

function testRelTolNoMatch(testCase)
    a = [0.959492426392903, 0.655740699156587, 0.035711678574190, 0.849129305868777, 0.933993247757551, 0.678735154857773, 0.757740130578333, 0.743132468124916, 0.392227019534168, 0.655477890177557]';
    b = a + 1e-7;
    
    verifySize(testCase,inBoth(a,b,'RelTol',1e-7),[0,1]);
end

function testAbsTolMatch(testCase)
    a = [0.959492426392903, 0.655740699156587, 0.035711678574190, 0.849129305868777, 0.933993247757551, 0.678735154857773, 0.757740130578333, 0.743132468124916, 0.392227019534168, 0.655477890177557]';
    b = a + 1e-7;
    
    verifyEqual(testCase,inBoth(a,b,'AbsTol',1e-6),a);
end

function testAbsTolNoMatch(testCase)
    a = [0.959492426392903, 0.655740699156587, 0.035711678574190, 0.849129305868777, 0.933993247757551, 0.678735154857773, 0.757740130578333, 0.743132468124916, 0.392227019534168, 0.655477890177557]';
    b = a + 1e-7;
    
    verifySize(testCase,inBoth(a,b,'AbsTol',1e-8),[0,1]);
end
