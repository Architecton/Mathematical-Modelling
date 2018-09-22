grid on

% graficni prikaz izracunanih lokacij sprejemnikov
for i = 1 : size(R)(1)
  plot(R(i, 1), R(i, 2), "b.");
  txt = 'sprejemnik';
  txt = strcat(txt, {' '}, int2str(i));
  text(R(i, 1), R(i, 2), txt);
  hold on
end

% graficni prikaz lokacij oddajnikov
for i = 1: size(oddajniki)(1)
  plot(oddajniki(i, 1), oddajniki(i, 2), 'r.');
  txt = 'oddajnik';
  txt = strcat(txt, {' '}, int2str(i));
  text(oddajniki(i, 1), oddajniki(i, 2), txt);
  hold on
end

% naslovi in oznake
axis_on(10);
title("Lokacije oddajnikov in izračunane lokacije sprejemnikov");
xlabel('x koordinata');
ylabel('y koordinata');