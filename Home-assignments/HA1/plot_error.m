load("io-test.txt");
load("io-train.txt");

x_train = io_train(1, :);
y_train = io_train(2, :);

x_test = io_test(1, :);
y_test = io_test(2, :);

errors = zeros(4, 2);

for n = 1:50
  h = movavg(x_train, y_train, n);
  y_predict = prediction(x_test, h);
  error_vect = abs(y_predict(end - 499:end) - y_test(end - 499:end)');
  errors(n, 1) = n;
  errors(n, 2) = mean(error_vect);
  hold on;
end

plot(errors(:, 1), errors(:, 2));