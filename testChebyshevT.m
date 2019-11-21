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
    for n = 2:10:100
        actual = myChebyshevT(n, x);
        expected = chebyshevT(n, x);
        verifyEqual(testCase, actual, expected, ...
            'AbsTol', 1e-10, 'RelTol', 1e-10);
    end
end

function testDifferentiation(testCase)
    N = 4;
    vec = eye(N);
    D = computeChebyshevDifferentiationMatrix(N);
    
    actual = D * vec;
    expected = [...
         0     1     0     3
         0     0     4     0
         0     0     0     6
         0     0     0     0];
    
    verifyEqual(testCase, actual, expected);
end

function testIntegration(testCase)
    N = 4;
    vec = eye(N);
    I = computeChebyshevIntegrationMatrix(N);

    actual = I * vec;
    expected = [...
         0    0.5000         0         0
    1.0000         0    0.5000         0
         0    0.5000         0    0.2500
         0         0       1/6         0
         0         0         0    0.1250];
     
    verifyEqual(testCase, actual, expected);
end

function testProduct(testCase)
    N = 3;
    vec = eye(N);
    actual = zeros(9,3);
    for n = 1:N
        actual(:,n) = computeChebyshevProduct(vec(:,n), vec(:,2));
    end
    expected = [...
        0    0.5000         0
   1.0000         0    0.5000
        0    0.5000         0
        0         0    0.5000
        0         0         0
        0         0         0
        0         0         0
        0         0         0
        0         0         0];
    
    verifyEqual(testCase, actual, expected);
end