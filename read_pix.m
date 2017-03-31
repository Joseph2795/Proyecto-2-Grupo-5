mat = fopen('resultados.txt', 'r');
B = fscanf(mat, ' %d ');
cnt1 = 1;
cnt2 = 1;
cnt3 = 1;
while (cnt2 <= 525)
  while (cnt1 <= 800)
     A(cnt2,cnt1) = B(cnt3,1);
     cnt1 = cnt1+1;
     cnt3 = cnt3+1;
  end
  cnt2 = cnt2+1;
  cnt1 = 1;
end
imagesc(A);