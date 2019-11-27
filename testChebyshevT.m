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

function testInverseChebyshevTransform(testCase)
    N = 3;
    vec = eye(N);
    z = linspace(-1,1)';
    
    actual = inverseChebyshevTransform(vec(:,1), z);
    expected = ones(length(z),1);
    verifyEqual(testCase, actual, expected)
    
    actual = inverseChebyshevTransform(vec(:,2), z);
    expected = z;
    verifyEqual(testCase, actual, expected)
    
    actual = inverseChebyshevTransform(vec(:,3), z);
    expected = 2*z.^2 - 1;
    verifyEqual(testCase, actual, expected)
    
    actual = inverseChebyshevTransform([1, 1, 1]', z);
    expected = 2*z.^2 + z;
    verifyEqual(testCase, actual, expected, 'AbsTol', eps)
    
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

function testNormConstant(testCase)
    vec = [1, 0, 0]';
    
    actual = computeChebyshevNorm(vec);
    expected = [1, 0, 0, 0, 0, 0, 0, 0, 0]';
    
    verifyEqual(testCase, actual, expected)
end

function testNormComplexConstant(testCase)
    vec = [1 + 1i, 0, 0]';
    
    actual = computeChebyshevNorm(vec);
    expected = [2, 0, 0, 0, 0, 0, 0, 0, 0]';
    
    verifyEqual(testCase, actual, expected)
end

function testNormLinear(testCase)
    vec = [0, 1, 0]';
    
    actual = computeChebyshevNorm(vec);
    expected = [1/2, 0, 1/2, 0, 0, 0, 0, 0, 0]';
    
    verifyEqual(testCase, actual, expected)
end

function testNormComplexLinear(testCase)
    vec = [0, 1 + 1i, 0]';
    
    actual = computeChebyshevNorm(vec);
    expected = [1, 0, 1, 0, 0, 0, 0, 0, 0]';
    
    verifyEqual(testCase, actual, expected)
end

function testNormQuadratic(testCase)
    vec = [0, 0, -1]';
    
    actual = computeChebyshevNorm(vec);
    expected = [1/2, 0, 0, 0, 1/2, 0, 0, 0, 0]';
    
    verifyEqual(testCase, actual, expected)
end

function testNormComplexQuadratic(testCase)
    vec = [0, 0, -1 - 1i]';
    
    actual = computeChebyshevNorm(vec);
    expected = [1, 0, 0, 0, 1, 0, 0, 0, 0]';
    
    verifyEqual(testCase, actual, expected)
end

function testNorm(testCase)
    N = 3;
    vec = [2, 1i, 2]';
    
    actual = computeChebyshevNorm(vec);
    expected = [13, 0, 17, 0, 4, 0, 0, 0, 0]'/2;
    
    verifyEqual(testCase, actual, expected)
end