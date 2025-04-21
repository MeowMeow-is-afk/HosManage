package com.user.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.itextpdf.text.pdf.draw.LineSeparator;

@WebServlet("/GenerateAppointmentSlip")
public class GenerateAppointmentSlip extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String appoint_date = request.getParameter("appoint_date");
        String email = request.getParameter("email");
        String phno = request.getParameter("phno");
        String diseases = request.getParameter("diseases");
        String doctorIdStr = request.getParameter("doctor");
        String address = request.getParameter("address");

        String doctorInfo = "Not Available";
        try {
            int doctorId = Integer.parseInt(doctorIdStr);
            DoctorDao dao = new DoctorDao(DBConnect.getConn());
            Doctor doc = dao.getDoctorById(doctorId);
            doctorInfo = doc.getFullName() + " (" + doc.getSpecialist() + ")";
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=AppointmentSlip.pdf");

            Document document = new Document(PageSize.A4, 40, 40, 50, 50);
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Define fonts
            Font titleFont = new Font(Font.FontFamily.HELVETICA, 22, Font.BOLD, new BaseColor(33, 37, 41));
            Font subtitleFont = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, new BaseColor(70, 70, 70));
            Font headerFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.DARK_GRAY);
            Font valueFont = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLACK);
            Font footerFont = new Font(Font.FontFamily.HELVETICA, 10, Font.ITALIC, new BaseColor(120, 120, 120));

            // Header: Hospital Name
            Paragraph hospital = new Paragraph("CUREWELL HOSPITAL", titleFont);
            hospital.setAlignment(Element.ALIGN_CENTER);
            hospital.setSpacingAfter(8f);
            document.add(hospital);

            // Horizontal line
            LineSeparator line = new LineSeparator();
            line.setLineColor(new BaseColor(200, 200, 200));
            document.add(new Chunk(line));

            // Date
            Paragraph dateTime = new Paragraph("Generated on: " + new SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(new Date()), footerFont);
            dateTime.setAlignment(Element.ALIGN_RIGHT);
            dateTime.setSpacingAfter(20f);
            document.add(dateTime);

            // Section title
            Paragraph section = new Paragraph("Appointment Details", subtitleFont);
            section.setAlignment(Element.ALIGN_CENTER);
            section.setSpacingAfter(12f);
            document.add(section);

            // Styled Info Table
            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(100);
            table.setSpacingBefore(10f);
            table.setWidths(new float[]{1f, 2.5f});

            // Add table rows
            addStyledRow(table, "Patient Name", fullname, headerFont, valueFont, false);
            addStyledRow(table, "Gender", gender, headerFont, valueFont, true);
            addStyledRow(table, "Age", age, headerFont, valueFont, false);
            addStyledRow(table, "Appointment Date", appoint_date, headerFont, valueFont, true);
            addStyledRow(table, "Email", email, headerFont, valueFont, false);
            addStyledRow(table, "Phone Number", phno, headerFont, valueFont, true);
            addStyledRow(table, "Diseases", diseases, headerFont, valueFont, false);
            addStyledRow(table, "Doctor Assigned", doctorInfo, headerFont, valueFont, true);
            addStyledRow(table, "Address", address, headerFont, valueFont, false);

            document.add(table);

            // Thank You note
            Paragraph thanks = new Paragraph("\nThank you for choosing CureWell.\nWe wish you a speedy recovery!", headerFont);
            thanks.setAlignment(Element.ALIGN_CENTER);
            thanks.setSpacingBefore(25f);
            document.add(thanks);

            // Footer Line
            document.add(new Chunk("\n"));
            document.add(new Chunk(line));

            // Footer Contact Info
            Paragraph footer = new Paragraph("Contact: +1-800-543-7291 | www.curewellhospital.com", footerFont);
            footer.setAlignment(Element.ALIGN_CENTER);
            footer.setSpacingBefore(10f);
            document.add(footer);

            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void addStyledRow(PdfPTable table, String label, String value, Font labelFont, Font valueFont, boolean alternateColor) {
        BaseColor bgColor = alternateColor ? new BaseColor(245, 245, 245) : BaseColor.WHITE;

        PdfPCell labelCell = new PdfPCell(new Phrase(label, labelFont));
        PdfPCell valueCell = new PdfPCell(new Phrase(value, valueFont));

        labelCell.setBorder(Rectangle.NO_BORDER);
        valueCell.setBorder(Rectangle.NO_BORDER);
        labelCell.setBackgroundColor(bgColor);
        valueCell.setBackgroundColor(bgColor);

        labelCell.setPadding(8f);
        valueCell.setPadding(8f);

        table.addCell(labelCell);
        table.addCell(valueCell);
    }
}
