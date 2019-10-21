function tests = testFollowLine()
    tests = functiontests(localfunctions);
end

function testParrallel(testCase)
    x = linspace(0,1)';
    y = [0*x, 1 + 0*x];
    
    actual = followLine(y)';
    
    verifyEqual(testCase, actual, y);
end

function testLinearCrossIncreasing(testCase)
    x = linspace(0,1)';
    y = sort([x, 0.5 + 0*x],2);
    
    actual = followLine(y)';
    expected = [y(1:50,:);y(51:100,2:-1:1)];
    
    verifyEqual(testCase, actual, expected);
end

function testLinearCrossIncreasingOpposite(testCase)
    x = linspace(0,1)';
    y = sort([0.5 + 0*x, x],2);
    
    actual = followLine(y)';
    expected = [y(1:50,:);y(51:100,2:-1:1)];
    
    verifyEqual(testCase, actual, expected);
end

function testLinearCrossDecreasing(testCase)
    x = linspace(0,1)';
    y = sort([1 - x, 0.5 + 0*x],2);
    
    actual = followLine(y)';
    expected = [y(1:50,:);y(51:100,2:-1:1)];  
    
    verifyEqual(testCase, actual, expected);
end

function testLinearCrossDecreasingOpposite(testCase)
    x = linspace(0,1)';
    y = sort([ 0.5 + 0*x, 1 - x],2);
    
    actual = followLine(y)';
    expected = [y(1:50,:);y(51:100,2:-1:1)];
    
    plot(x,actual)
    figure
    plot(x,expected)
    
    verifyEqual(testCase, actual, expected);
end

function testParabola(testCase)
    x = linspace(0,1)';
    y = [0.5 + x + x.^2, 1 - x + 2 * x.^2];
    
    actual = followLine(sort(y,2))';
    
    plot(x,actual)
    figure
    plot(x,y)
    
    verifyEqual(testCase, actual, y);
end

function testParabolaUpsideDown(testCase)
    x = linspace(0,1)';
    y = -[0.5 + x + x.^2, 1 - x + 2 * x.^2];
    
    actual = followLine2(sort(y,2))';
    
    plot(x,actual)
    figure
    plot(x,y)
    
    verifyEqual(testCase, actual, y);
end