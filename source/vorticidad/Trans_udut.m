function UDUT=Trans_udut(n,k,ut)

    dut(1,:)=i.*k(1,:).*ut(1,:);                    % du/dx en el espacio de fourier
    u(1,:)=ifft(ut(1,:));                           % vector u en el espacio real
    du(1,:)=ifft(dut(1,:));                         % vector du/dx en el espacio real
    udu(1,:)=u(1,:).*du(1,:);                       % u*du/dx en el espacio real
    UDUT(1,:)=fft(udu(1,:));                        % u*du/dx en el espacio de fourier
