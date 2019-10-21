function tests = testChebyshevT()
    tests = functiontests(localfunctions);
end

function test0(testCase)
    x = linspace(0,1)';
    actual = myChebyshevT(0, x);
    expected = chebyshevT(0, x);
    verifyEqual(testCase, actual, expected, ...
        'AbsTol', 1e-10, 'RelTol', 1e-10);
end

function test1(testCase)
    x = linspace(0,1)';
    actual = myChebyshevT(1, x);
    expected = chebyshevT(1, x);
    verifyEqual(testCase, actual, expected, ...
        'AbsTol', 1e-10, 'RelTol', 1e-10);
end

function test2UpTo100(testCase)
    x = linspace(0,1)';
    for n = 2:100
        actual = myChebyshevT(n, x);
        expected = chebyshevT(n, x);
        verifyEqual(testCase, actual, expected, ...
            'AbsTol', 1e-10, 'RelTol', 1e-10);
    end
end