function tests = tests()
    tests = functiontests(localfunctions);
end

function test(testCase)
    a = ones(10,1);
    b = zeros(10,1);
    b2 = b;
    b2(1) = 1;
    r = [0.959492426392903, 0.655740699156587, 0.035711678574190, 0.849129305868777, 0.933993247757551, 0.678735154857773, 0.757740130578333, 0.743132468124916, 0.392227019534168, 0.655477890177557]';
    r2 = r;
    r2(1) = 1;
    r3 = r + 1e-7;
    
    verifyEqual(testCase,inBoth(a,a),a);
    verifyEqual(testCase,inBoth(b,b),b);
    verifyEqual(testCase,inBoth(r,r),r);
    verifyEqual(testCase,inBoth(r,r3,'AbsTol',1e-6),r);
    verifyEqual(testCase,inBoth(r,r3,'RelTol',1e-4),r);
    verifyEqual(testCase,inBoth(r,r3,'AbsTol',1e-6,'RelTol',1e-4),r);
    verifyEqual(testCase,inBoth(r,[r;r]),r);
    verifyEqual(testCase,inBoth([r;r],r),r);
    verifyEqual(testCase,inBoth(b2,r2),1);
    verifyEqual(testCase,inBoth(r2,b2),1);
    verifyEqual(testCase,inBoth(a,r2),1);
    verifyEqual(testCase,inBoth(r2,a),1);
    
    verifyEqual(testCase,inBoth(a,b),[]);
    verifyEqual(testCase,inBoth(r,r3,'AbsTol',1e-8),[]);
    verifyEqual(testCase,inBoth(r,r3,'RelTol',1e-6),[]);
    verifyEqual(testCase,inBoth(r,r3,'AbsTol',1e-8,'RelTol',1e-6),[]);
end

function testLongWave(testCase)
    k = 1; R = 1; cotbeta = 1; S = 1;
    AD = 1; AT = 1; AB = 1; AK = 1; AI = 1;
    
    actual = compute_long_wave(k,R,cotbeta,S,AD,AT,AB,AK,AI);
    expected = 0.5 - 0.466666666666667i;
    
    verifySize(testCase, actual, [1, 1]);
    verifyEqual(testCase, actual, expected,'AbsTol',1e-15);
end

function testLongWaveVector(testCase)
    k = ones(100,1); R = 1; cotbeta = 1; S = 1;
    AD = 1; AT = 1; AB = 1; AK = 1; AI = 1;
    
    actual = compute_long_wave(k,R,cotbeta,S,AD,AT,AB,AK,AI);
    expected = (0.5 - 0.466666666666667i)*k;
    
    verifySize(testCase, actual, [100, 1]);
    verifyEqual(testCase, actual, expected,'AbsTol',1e-15);
end

function testZeroReynolds(testCase)
    k = 1; cotbeta = 1; S = 1;
    AD = 1; AT = 1; AB = 1; AK = 1; AI = 1;
    
    actual = compute_zero_reynolds(k,cotbeta,S,AD,AT,AB,AK,AI);
    expected = [1.238715733748955 + 0.137975528959789i, ...
        1.767603508175014 - 0.558433545899801i, ...
        -1.710557319115801 - 1.421577867199287i];
    
    verifySize(testCase, actual, [1, 3]);
    verifyEqual(testCase, actual, expected,'AbsTol',1e-15);
end

function testZeroReynoldsVector(testCase)
    k = ones(100,1); cotbeta = 1; S = 1;
    AD = 1; AT = 1; AB = 1; AK = 1; AI = 1;
    
    actual = compute_zero_reynolds(k,cotbeta,S,AD,AT,AB,AK,AI);
    expected = [1.238715733748955 + 0.137975528959789i, ...
        1.767603508175014 - 0.558433545899801i, ...
        -1.710557319115801 - 1.421577867199287i].*k;
    
    verifySize(testCase, actual, [100, 3]);
    verifyEqual(testCase, actual, expected,'AbsTol',1e-15);
end

function testZeroReynoldsPolySolve(testCase)
    k = 1; cotbeta = 1; S = 1;
    AD = 1; AT = 1; AB = 1; AK = 1;
    
    actual = compute_zero_reynolds_poly_solve(k,cotbeta,S,AD,AT,AB,AK);
    expected = [0.196839480807356 + 0.318190487163222i, ...
        0.769166674431962 + 0.042870493499694i, ...
        1];
    
    verifySize(testCase, actual, [1, 3]);
    verifyEqual(testCase, actual, expected,'AbsTol',1e-14);
end

function testNumerical(testCase)
    k = 1; R = 1; cotbeta = 1; S = 1;
    AD = 1; AT = 1; AB = 1; AK = 1; AI = 1;
    modes = 5;
    actual = compute_numerical(k,R,cotbeta,S,AD,AT,AB,AK,AI);
    expected = 1.0e+02 * [ ...
        0.011733305393037 + 0.001627690450129i, ...
        0.017151795941829 - 0.004392464293491i, ...
        -0.009111783956488 - 0.007810596242121i, ...
        0.003093425553740 - 0.056103531413731i, ...
        0.005866385981105 - 0.221084577367044i];
    
    verifySize(testCase, actual(1:modes), [1, modes]);
    verifyEqual(testCase, actual(1:modes), expected,'AbsTol',1e-7);
end

function testNumericalMatchesLongWaveForSmallK(testCase)
    k = 0.01; R = 1; cotbeta = 1; S = 1;
    AD = 1; AT = 1; AB = 1; AK = 1; AI = 1;
    
    numerical = compute_numerical(k,R,cotbeta,S,AD,AT,AB,AK,AI);
    longwave = compute_long_wave(k,R,cotbeta,0,0,0,0,AK,0);
    
    verifyEqual(testCase, numerical(1), longwave, 'AbsTol', 1e-3, 'RelTol', 1e-4)
end

function testNumericalMatchesZeroReynolds(testCase)
    k = 1; R = 0; cotbeta = 1; S = 1;
    AD = 1; AT = 1; AB = 1; AK = 1; AI = 1;
    
    numerical = compute_numerical(k,R,cotbeta,S,AD,AT,AB,AK,AI);
    zeroReynolds = compute_zero_reynolds(k,cotbeta,S,AD,AT,AB,AK,AI);
    
    verifyEqual(testCase, numerical(1:3), zeroReynolds(1:3), 'AbsTol', 1e-10, 'RelTol', 1e-10)
end


function testSwitchboardOutputSize(testCase)
    k = 1; R = 1; cotbeta = 1; S = 1;
    AD = 1; AT = 1; AB = 1; AK = 1; AI = 1;
    modes = 4;
    methods = {"n", "l", "s", "z", "p"};
    
    for j = 1:length(methods)
        actual = compute_c_switchboard(methods{j},k,R,cotbeta,S,AD,AT,AB,AK,AI,modes);
        verifySize(testCase, actual, [1,modes]);
    end
end

function testSwitchboardNumerical(testCase)
    k = 1; R = 1; cotbeta = 1; S = 1;
    AD = 1; AT = 1; AB = 1; AK = 1; AI = 1;
    modes = 5;
    
    numerical = compute_numerical(k,R,cotbeta,S,AD,AT,AB,AK,AI);
    switchboard = compute_c_switchboard("n",k,R,cotbeta,S,AD,AT,AB,AK,AI,modes);
    
    verifyEqual(testCase, switchboard, numerical(1:modes), "AbsTol", 1e-15);
end

function testSwitchboardLongwave(testCase)
    k = 1; R = 1; cotbeta = 1; S = 1;
    AD = 1; AT = 1; AB = 1; AK = 1; AI = 1;
    modes = 1;
    
    longwave = compute_long_wave(k,R,cotbeta,0,0,0,0,AK,0);
    switchboard = compute_c_switchboard("l",k,R,cotbeta,S,AD,AT,AB,AK,AI,modes);
    
    verifyEqual(testCase, switchboard, longwave, "AbsTol", 1e-15);
end

function testSwitchboardLongwaveScaled(testCase)
    k = 1; R = 1; cotbeta = 1; S = 1;
    AD = 1; AT = 1; AB = 1; AK = 1; AI = 1;
    modes = 1;
    
    longwave = compute_long_wave(k,R,cotbeta,S*(k.^2),AD*(k),AT*(k.^2),AB*(k.^4),AK,AI*(k.^2));
    switchboard = compute_c_switchboard("s",k,R,cotbeta,S,AD,AT,AB,AK,AI,modes);
    
    verifyEqual(testCase, switchboard, longwave, "AbsTol", 1e-15);
end

function testSwitchboardZeroReynolds(testCase)
    k = 1; R = 1; cotbeta = 1; S = 1;
    AD = 1; AT = 1; AB = 1; AK = 1; AI = 1;
    modes = 3;
    
    zeroReynolds = compute_zero_reynolds(k,cotbeta,S,AD,AT,AB,AK,AI);
    switchboard = compute_c_switchboard("z",k,R,cotbeta,S,AD,AT,AB,AK,AI,modes);
    
    verifyEqual(testCase, switchboard, zeroReynolds, "AbsTol", 1e-15);
end

function testSwitchboardZeroReynoldsPolySolve(testCase)
    k = 1; R = 1; cotbeta = 1; S = 1;
    AD = 1; AT = 1; AB = 1; AK = 1; AI = 1;
    modes = 3;
    
    zeroReynoldsPolySolve = compute_zero_reynolds_poly_solve(k,cotbeta,S,AD,AT,AB,AK);
    switchboard = compute_c_switchboard("p",k,R,cotbeta,S,AD,AT,AB,AK,AI,modes);
    
    verifyEqual(testCase, switchboard, zeroReynoldsPolySolve, "AbsTol", 1e-15);
end

function testSwitchboardUnknownMethod(testCase)
    k = 1; R = 1; cotbeta = 1; S = 1;
    AD = 1; AT = 1; AB = 1; AK = 1; AI = 1;
    modes = 3;
    
    try
        compute_c_switchboard("a",k,R,cotbeta,S,AD,AT,AB,AK,AI,modes);
    catch myError
        verifyEqual(testCase, myError.message, 'Unknown method.');
    end
end

function testResidual(testCase)
    modes = 5;
    [val,~,res] = compute_numerical(1,1,1,1,1,1,1,1,1);
    actual = abs(res(val~=0));
    actual = actual(1:modes);
    verifyEqual(testCase,actual,zeros(size(actual)),'AbsTol',1e-8)
end

function testConvergence(testCase)
    numberOfPolynomials = 1:70;
    eigenvalue = zeros(length(numberOfPolynomials),1);
    sizeOfEigenvalue = zeros(length(numberOfPolynomials),1);
    for j = 1:length(numberOfPolynomials)
        c = compute_numerical(1,1,1,1,1,1,1,1,1,numberOfPolynomials(j));
        eigenvalue(j) = c(1);
        sizeOfEigenvalue(j) = length(c);
    end
    
%     figure;
%     plot(numberOfPolynomials,eigenvalue);
%     figure;
%     plot(numberOfPolynomials(1:end-1),log10(abs(diff(eigenvalue))));
%     figure;
%     plot(numberOfPolynomials,sizeOfEigenvalue)

    minCorrectNumberOfPolynomials = 40;
    actual = abs(diff(eigenvalue(minCorrectNumberOfPolynomials:end)));
    
    verifyEqual(testCase,actual,zeros(size(actual)),'AbsTol',1e-8)
end

function testConvergenceLargeReynolds(testCase)
    numberOfPolynomials = 1:100;
    modes = 5;
    eigenvalues = zeros(length(numberOfPolynomials),modes);
    sizeOfEigenvalue = zeros(length(numberOfPolynomials),1);
    for j = 1:length(numberOfPolynomials)
        c = compute_numerical(12.7,10000,cot(pi/4),1000,0,0,0,0,0,numberOfPolynomials(j));
        eigenvalues(j,:) = c(1:5);
        sizeOfEigenvalue(j) = length(c);
    end
    
%     figure;
%     plot(numberOfPolynomials,eigenvalues);
%     legend
%     figure;
%     plot(numberOfPolynomials(1:end-1),log10(abs(diff(eigenvalues))));

    minCorrectNumberOfPolynomials = 40;
    actual = abs(diff(eigenvalues(minCorrectNumberOfPolynomials:end,:)));
    
    verifyEqual(testCase,actual,zeros(size(actual)),'AbsTol',1e-5)
end