package com.company.exception;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.util.Date;

@ControllerAdvice
public class CustomGlobalExceptionHandler extends ResponseEntityExceptionHandler {

    /* Http Request Method Not Supported */
    @Override
    protected ResponseEntity<Object> handleHttpRequestMethodNotSupported(HttpRequestMethodNotSupportedException ex, HttpHeaders headers, HttpStatus status, WebRequest request) {
        CustomErrorDetails details = new CustomErrorDetails(new Date() ,
                "HttpRequestMethodNotSupported" ,
                ex.getMessage());
        return new ResponseEntity<>(details , HttpStatus.BAD_REQUEST);
    }

    /* Patient Not Found Exception */
    public final ResponseEntity<Object> handlePatientNotFoundEntity(PatientNotFoundException ex, HttpHeaders headers, HttpStatus status, WebRequest request){
        CustomErrorDetails details = new CustomErrorDetails(new Date() ,
                "PatientNotFoundException" ,
                ex.getMessage());
        return new ResponseEntity<>(details , HttpStatus.NOT_FOUND);
    }
}
